(function () {
  "use strict";

  angular.module("app").controller("politiciansCtrl", function($scope, $http) {

		$scope.goTo = function (politicianId){
			location.href = '/politicians/' + politicianId;

		//   window.scope = $scope;
		};
	});
}())