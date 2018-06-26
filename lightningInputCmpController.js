({
  validateInput : function(component, event, helper) {
      var inputComponent = component.find('myinput');
      inputComponent.setCustomValidity('CUSTOMIZED MESSAGE');
  }
})