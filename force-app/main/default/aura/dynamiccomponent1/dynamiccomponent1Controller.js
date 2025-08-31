({
	doInit : function(component, event, helper) {
        alert('testt')
        $A.createComponent(
            "lightning:button",
                {
                "aura:id": "testid",
                "label":"click me",
                    "variant":"destructive",
                "onclick":component.getReference("c.handleClick")
            },
                function(newButton,status,errorMessage)
            {
                if(status === 'SUCCESS'){
                    var body = component.get("v.body");
                    body.push(newButton);
                    component.set("v.body",body);
                }
                else if(status === 'ERROR'){
                    alert('error'+errorMessage);
                }
                else if(status === 'INCOMPLETE')
                {
                    alert('error ggg');
                }
            }
        )
	},
    handleClick : function (component,event,helper)
    {
        component.set("v.message",'tests message');
    },
    createcompo : function (component,event,helper)
    {
        $A.createComponents(
            [
                
            [
                "lightning:button",
               {
                "aura:id": "testid1",
                "label":"click me 1",
                    "variant":"destructive",
               
            },
            ],
            [
                 "lightning:button",
               {
                "aura:id": "testid2",
                "label":"click me 2",
                    "variant":"destructive",
                
            },
            ],
            [
                 "lightning:button",
               {
                "aura:id": "testid3",
                "label":"click me 3",
                    "variant":"destructive",
                "onclick":component.getReference("c.handleClick2")
            },
            ],

                ["lightning:input",
                 {
                     "aura:id":'testid4',
                     "PlaceHolder":"type any thing...",
                     "type":"text",
                     "label":"textttts"
                 }
    
                        ]                
                
            ],
            function(cmp,status,errormessage)
            {
                if(status === 'SUCCESS'){
                 var body =  component.get("v.body");
                    cmp.forEach((item)=>{
                        body.push(item);
                    })
                        component.set("v.body",body);
                    
                }
            }
        
        )
    },
       handleClick2 : function(component,event,helper)
                        {
                        var jj = component.find("testid4").get("v.value");
                        alert('jj va;ue is ==>'+jj);
                    },
                        killaction : function(component,event,helper)
                        {
                            var aa = component.find("testid1");
                            alert('aa ==>'+aa);
                            aa.destroy();
                             var bb = component.find("testid2");
                            bb.destroy();
                             var cc = component.find("testid3");
                            cc.destroy();
                             var dd = component.find("testid4");
                           dd.destroy();
                        },
                        handletimeout : function(component,event,helper)
                        {
                            window.setTimeout(
   function() {
        component.set("v.visible", true);
    }, 5000
);
                        }
                        
                        
})