public class pagereferenceclass {

    
     public PageReference saveMethod()
    {
  PageReference pgref = new PageReference('https://tccss-dev-ed.develop.my.salesforce.com/services/oauth2/authorize?response_type=token&client_id=3MVG9pRzvMkjMb6lML2SiNrBmNb8RoeTeIJE60t5_lA7FgLMljutcG0n67LvxWGEukf5g.jqhG6eIOnrg7Y3_&redirect_uri=https://www.salesforce.com&state=mystate');
        pgref.setRedirect(true);
        return pgref;
    }
}