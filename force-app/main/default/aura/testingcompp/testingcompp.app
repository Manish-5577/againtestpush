<aura:application extends ="force:slds" >
    <aura:attribute name ="storestring" type ="string"/>
    <lightning:input value="{!v.storestring}" aura:id ="one" label="testing" onchange ="{!c.handlechange}"/>
    {!v.storestring}
</aura:application>