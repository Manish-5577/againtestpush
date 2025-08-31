const events = {}; 

const samePageRef = (pageRef1, pageRef2) => { 

    const obj1 = pageRef1.attributes; 

    const obj2 = pageRef2.attributes; 

    return Object.keys(obj1) 

        .concat(Object.keys(obj2)) 

        .every(key => { 

            return obj1[key] === obj2[key]; 

        }); 

}; 

/** 

 * Registers a callback for an event 

 * @param {string} eventName – Name of the event to listen for. 

 * @param {function} callback – Function to invoke when said event is fired. 

 * @param {object} thisArg – The value to be passed as the this parameter to the callback function is bound. 

 */ 
     
const registerListener = (eventName, callback, thisArg) => { 

    // Checking that the listener has a pageRef property. We rely on that property for filtering purpose in fireEvent() 
       console.log('pubsub registered ==>'+JSON.stringify(thisArg));
       console.log('pubsub registered  event name ==>'+eventName);
       console.log('pubsub registered  event name object  ==>'+events[eventName]);
    if (!thisArg.pageRef) { 

        throw new Error( 
                 
            'pubsub listeners need a "@wire(CurrentPageReference) pageRef" property' 

        ); 

    } 
     
    if (!events[eventName]) { 
            console.log('event name in register method ==> '+eventName);
        events[eventName] = []; 

    } 

    const duplicate = events[eventName].find(listener => { 
                          console.log('pub sub register method ==>listener call back'+listener.callback);
                          console.log('pub sub register method ==>listener.thisArg'+listener.thisArg);
        return listener.callback === callback && listener.thisArg === thisArg; 

    });

    if (!duplicate) { 
               console.log('regiter event callback this arg   ==>'+thisArg )
        events[eventName].push({ callback, thisArg }); 
              console.log('if not duplicate register  ==>'+thisArg   +  'callback ==>'+ callback);
    } 

}; 

/** 

 * Unregisters a callback for an event 

 * @param {string} eventName – Name of the event to unregister from. 

 * @param {function} callback – Function to unregister. 

 * @param {object} thisArg – The value to be passed as the this parameter to the callback function is bound. 

 */ 

const unregisterListener = (eventName, callback, thisArg) => { 
        
    if (events[eventName]) { 
            
        events[eventName] = events[eventName].filter( 

            listener => 

                listener.callback !== callback || listener.thisArg !== thisArg 

        ); 

    } 

}; 

/** 

 * Unregisters all event listeners bound to an object. 

 * @param {object} thisArg – All the callbacks bound to this object will be removed. 

 */ 

const unregisterAllListeners = thisArg => { 

    Object.keys(events).forEach(eventName => { 

        events[eventName] = events[eventName].filter( 

            listener => listener.thisArg !== thisArg 

        ); 

    }); 

}; 

/** 

 * Fires an event to listeners. 

 * @param {object} pageRef – Reference of the page that represents the event scope. 

 * @param {string} eventName – Name of the event to fire. 

 * @param {*} payload – Payload of the event to fire. 

 */ 

const fireEvent = (pageRef, eventName, payload) => { 
        console.log('pubsub checcking fire eventname==>'+JSON.stringify(events[eventName]));
        console.log('pubsub checcking fire eventnameonly==>'+JSON.stringify(eventName));

    if (events[eventName]) { 

        const listeners = events[eventName]; 
               console.log('listener object in fire method ==>'+listeners)
        listeners.forEach(listener => { 
               console.log('pubsub checking fire  listener==>'+JSON.stringify(listener.thisArg.pageRef));
            if (samePageRef(pageRef, listener.thisArg.pageRef)) { 
            
                try { 

                    listener.callback.call(listener.thisArg, payload); 

                } catch (error) { 

                    // fail silently 

                } 

            } 

        }); 

    } 

}; 

export { 

    registerListener, 

    unregisterListener, 

    unregisterAllListeners, 

    fireEvent 

};