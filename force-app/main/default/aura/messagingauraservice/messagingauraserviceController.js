({
  sendHandler: function(component, event, helper) {
    const inputElement = component.find("inputBox");
    if (inputElement) {
      const msg = inputElement.get("v.value");
      const messages = component.get("v.messages");
      messages.push({
        id: messages.length,
        value: msg,
        from: "AURA"
      });
      component.set("v.messages", messages);

      const messagePayload = {
        message: msg,
        from: "AURA"
      };

      const msgChanel = component.find("messageChannel");
      msgChanel.publish(messagePayload);

      inputElement.set("v.value", "");
    }
  },

  messageHandler: function(component, event, helper) {
    //Method defination goes here
    if (
      event &&
      event.getParam("message33") &&
      event.getParam("from") !== "AURA"
    ) {
      //  alert('what is event'+event);
      const msg = event.getParam("message33");
   //     alert('msg==>'+msg);
      const messages = component.get("v.messages");
      messages.push({
        id: messages.length,
        value: msg,
        from: "LWC"
      });
      component.set("v.messages", messages);
    }
  }
});