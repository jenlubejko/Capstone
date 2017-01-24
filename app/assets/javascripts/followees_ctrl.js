(function() {
  angular.module("app").controller("followeesCtrl", function($scope, $http) {
    $scope.setup = function() {
      $http.get('api/v1/followees').then(function(response) {
        $scope.followees = response.data;
        console.log($scope.followees);
        initializeMap($scope.followees);
      });
    };
  });
})();