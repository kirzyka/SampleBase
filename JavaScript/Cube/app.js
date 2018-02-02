(function (ng) {

    var app = ng.module('app', []);

    app.controller('MainCtrl', function () {
        var vm = this;

        function init() {
            vm.S1 = ng.copy(vm.U);
            vm.S2 = ng.copy(vm.L);
            vm.S3 = ng.copy(vm.F);
            vm.S4 = ng.copy(vm.R);
            vm.S5 = ng.copy(vm.B);
            vm.S6 = ng.copy(vm.D);
        }
        
        function spinUp() {
            var tmp = vm.S5;
            // 1 > 5 +180 
            vm.S5 = rotate90(rotate90(vm.S1));
            // 3 > 1
            vm.S1 = ng.copy(vm.S3);
            // 6 > 3
            vm.S3 = ng.copy(vm.S6);
            // 4 +90
            vm.S4 = rotate90(vm.S4);
            // 2 -90
            vm.S2 = rotate_90(vm.S2);
            // 5 > 6 +180
            vm.S6 = rotate90(rotate90(tmp));
            
        }

        function spinDown() {
            
        }
        
        function spinLeft() {
            
        }
        
        function spinRight() {
            var tmp = vm.S5;
            // 4 > 5
            vm.S5 = ng.copy(vm.S4);
            // 3 > 4
            vm.S4 = ng.copy(vm.S3);
            // 2 > 3
            vm.S3 = ng.copy(vm.S2);
            // 5 > 2
            vm.S2 = ng.copy(tmp);
            // 1 -90
            vm.S1 = rotate_90(vm.S1);
            // 6 +90
            vm.S6 = rotate90(vm.S6);
        }
        
        function rotate90(src) {
            var i = 0,
                arr = [];
            
            for(; i < 9; i++) { 
                arr[i + vm.s90[i]] = src[i];
            }
            return arr;
        }
        
        function rotate180(src) {
            
        }
        
        function rotate_90(src) {
            var i = 0,
                arr = [];
            
            for(; i < 9; i++) { 
                arr[i + vm.s_90[i]] = src[i];
            }
            return arr;
        }
        
        function rotate_180(src) {
            
        }
        
        // y b r g o w
        vm.hi = 'Hi!';
        vm.U = ['y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y'];
        vm.L = ['b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b'];
        vm.F = ['r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r'];
        vm.R = ['g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g'];
        vm.B = ['o', 'o', 'o', 'o', 'o', 'o', 'o', 'o', 'o'];
        vm.D = ['w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w'];
            
        vm.s90 = [2, 4, 6, -2, 0, 2, -6, -4, -2];
        vm.s_90 = [6, 2, -2, 4, 0, -4, 2, -2, -6];
        
        vm.init = init;
        vm.spinUp = spinUp;
        vm.spinDown = spinDown;
        vm.spinLeft = spinLeft;
        vm.spinRight = spinRight;

    });
    
})(angular);