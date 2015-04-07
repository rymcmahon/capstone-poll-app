(function () {
  "use strict";

  angular.module("app").controller("politiciansCtrl", function($scope, $http) {

  	$scope.orderByAttribute = "score";
  	$scope.descending = true;

		$scope.goTo = function (politicianId){
			location.href = '/politicians/' + politicianId;
		};

		$scope.fetchData = function() {
      $http.get("/politicians.json").then(function(response) {
        $scope.politicians = response.data;
      });
      
    };

    $scope.changeOrder = function(attribute) {
      $scope.orderByAttribute = attribute;
      $scope.descending = !$scope.descending;
    };
		  window.scope = $scope;
	});
}())
  	