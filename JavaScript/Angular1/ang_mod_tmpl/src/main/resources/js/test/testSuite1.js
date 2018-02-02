describeTestSuite('Unit Testing', [

    describe('Module Loading: core', function(w, ng) {
        return ng.module('core');
    }),
    describe('Module Loading: core.security', function(w, ng) {
        return ng.module('core.security');
    }),
    describe('Module Loading: core.messaging', function(w, ng) {
        return ng.module('core.messaging');
    }),
    describe('Module Loading: core.navigation.menu', function(w, ng) {
        return ng.module('core.navigation.menu');
    }),
    describe('Module Loading: core.component.date', function(w, ng) {
        return ng.module('core.component.date');
    }),
    describe('Module Loading: core.component.input', function(w, ng) {
        return ng.module('core.component.date');
    }),
    describe('Module Loading: core.component.menu', function(w, ng) {
        return ng.module('core.component.menu');
    }),
    describe('Module Loading: core.component.popup', function(w, ng) {
        return ng.module('core.component.popup');
    }),
    describe('Module Loading: core.boroda', function(w, ng) {
        return ng.module('core.boroda');
    }),
    describe('Module Loading: Error 1', function(w, ng) {
        return w.TestUtil.expect(ng.module('core')).to.be.a('string');
    }),
    describe('Module Loading: Error 2', function(w, ng) {
        return w.TestUtil.expect(ng.module('core')).to.be.a('Object');
    }),
    describe('Module Loading: Error 3', function(w, ng) {
        return w.TestUtil.expect(ng.module('core')).to.be.a('object');
    })

], 0);










