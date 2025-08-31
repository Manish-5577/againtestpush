({
	doinit : function(component, event, helper) {
		component.set("v.meetingroominfos", [
        {roomname : 'A02',roomcapacity :'12'},
        {roomname : 'A03',roomcapacity :'13'},
        {roomname : 'A04',roomcapacity :'14'},
        {roomname : 'A05',roomcapacity :'15'},
        {roomname : 'A06',roomcapacity :'16'},
        {roomname : 'A07',roomcapacity :'17'},
        {roomname : 'A08',roomcapacity :'18'},
    ])
	},
            handlechildlwcevent : function(component, event, helper) {
          //  alert('event===>'+JSON.stringify(event));
            component.set("v.selectedmeetingRoom",event.getParam('roomname'));
            component.set("v.selectedmeetingRoomcapacity",event.getParam('roomcapacity'));
            }
})