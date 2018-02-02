describeTestSuite = function (name, list, priopity) {
	aTest.testSuite.push({id: generateUID(), name: name, list: list, priopity: priopity || 1 / 0});
}

describe = function (name, func) {
	return {id: generateUID(), name: name, func: func, result: false};
}

aTest = {};
aTest.init = init;
aTest.testSuite = [];

function init(w) {


	var ng = w.angular;

	w.TestUtil = {};

	w.TestUtil.expect = chai.expect;

	w.TestUtil.getElement = function(val, parent, position) {
		position = position || 0;
		parent = parent || w.document;

		var el = $(parent).find(val);
		if(el.length <  position) {
			return null;
		}
		return el[position];
	};

	w.TestUtil.keypress = function (element, keycode) {
		var _event = w.document.createEvent('KeyboardEvent');

		Object.defineProperty(_event, 'keyCode', {
			get: function () {
				return this.keyCodeVal;
			}
		});
		Object.defineProperty(_event, 'which', {
			get: function () {
				return this.keyCodeVal;
			}
		});

		if (_event.initKeyboardEvent) {
			_event.initKeyboardEvent("keypress", true, true, w.document.defaultView, false, false, false, false, keycode, keycode);
		} else {
			_event.initKeyEvent("keypress", true, true, w.document.defaultView, false, false, false, false, keycode, 0);
		}
		_event.keyCodeVal = keycode;
		//element.dispatchEvent(_event);
		dispatchEvent(element, _event);
	}

	w.TestUtil.click = function (element) {
		ng.element(element).triggerHandler('click');
	};

	w.TestUtil.clickOnLink = function (element) {
		var href = element.href;
		var $window = ng.element(w.document).injector().get('$window');
		var timeoutF = ng.element(w.document).injector().get('$timeout');
		timeoutF(function () {
			//locationF.path(href);
			$window.location.path = href;
			$window.location.href = href;
			ng.element(w.document).scope().$apply();
		}, 0);

	};

	w.TestUtil.changeModelValue = function (element, property, value) {
		var model = ng.element(element).scope().this;
		var propArray = property.split('.');
		for (var i = 0; i < propArray.length - 1; i++) {
			var prop = propArray[i];
			model = model[prop];
		}
		prop = propArray[propArray.length - 1];
		model[prop] = value;
		ng.element(element).scope().$apply();
	};

	w.TestUtil.waitForElement = function(elementName) {
		var el = w.TestUtil.getElement(elementName);
		var k=0;
		while(!el && k < 1000) {
			el = w.TestUtil.getElement(elementName);
			k++;
		}
		return el;
	}

	run(w, ng);

	function dispatchEvent(element, event) {
		var timeoutF = ng.element(w.document).injector().get('$timeout');
		timeoutF(function () {
			element.dispatchEvent(event);
		}, 0);
	}

	function run(w, ng) {

		aTest.testSuite.sort(function (a, b) {
			return a.priopity > b.priopity
		});

		for (var i = 0; i < aTest.testSuite.length; i++) {
			var testSuite = aTest.testSuite[i];
			for (var j = 0; j < testSuite.list.length; j++) {
				var test = testSuite.list[j];
				try {
					test.result = !!test.func(w, ng);
				} catch (e) {
					test.result = e;
				}
				//test.result = test.result instanceof Error ? test.result : !!test.result;
			}
		}
		console.log(aTest.testSuite);
		printResult();
		// w.close();
	}

	function printResult() {
		var content = $('#content');

		for (var i = 0; i < aTest.testSuite.length; i++) {
			var testSuite = aTest.testSuite[i];

			var _testlist = $('<div>');
			for (var j = 0; j < testSuite.list.length; j++) {
				var test = testSuite.list[j];
				_testlist.append(
					$('<tr>').append(
						$('<td>').append(test.name)
					).append(
						$('<td class="w150">').append('today')
					).append(
						$('<td class="w150">').append('0.002s')
					).append(
						$('<td class="w150">').append(test.result.toString() == 'true' ? 'success' : 'error')
					)
				)
			}

			content.append(
				$('<p>').append(testSuite.name)
			).append(
				$('<table>').append(
					$('<tr>').append(
						$('<th>').append('Test')
					).append(
						$('<th class="w150">').append('Start at')
					).append(
						$('<th class="w150">').append('Duration')
					).append(
						$('<th class="w150">').append('Status')
					)
				).append(_testlist.html())
			);
		}
	}
}




function generateUID() {
	var d = new Date().getTime();
	var uuid = 'UIDxyxyxyxyxyxyxyxyxyxy'.replace(/[xy]/g, function (c) {
		var r = (d + Math.random() * 16) % 16 | 0;
		d = Math.floor(d / 16);
		return (c == 'x' ? r : (r & 0x3 | 0x8)).toString(16);
	});
	return uuid;
};