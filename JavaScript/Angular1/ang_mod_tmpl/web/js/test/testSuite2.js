describeTestSuite('UI Testing', [

    describe('Login', function(w, ng) {
        var loginForm = w.TestUtil.getElement('.login-form');
        var loginBtn = w.TestUtil.getElement('.login-btn');

        w.TestUtil.changeModelValue(loginForm, 'loginVm.user.email', 'kirzyka@gmail.com');
        //w.TestUtil.keypress(w.TestUtil.getElementsByTagName('input'), 13);
        w.TestUtil.click(loginBtn);

        var h2 = ng.element(w.TestUtil.getElement('h2'));
        if(h2 && h2.text() == 'Default Page') {
            return true;
        } else {
            return false;
        }
    }),
    describe('Go to page: Report', function(w, ng) {
        var menu = w.TestUtil.getElement('#inline_menu');
        var reportMenuItem = w.TestUtil.getElement('a', menu, 4);
        w.TestUtil.clickOnLink(reportMenuItem);
        var h2 = ng.element(w.TestUtil.waitForElement('h2'));
        if(h2 && h2.text() == 'Report') {
            return true;
        } else {
            return false;
        }
    })

]);


