(function() {
  angular.module("app").controller("foodiesCtrl", function($scope, $http) {
    $scope.setup = function() {
      $http.get('api/v1/foodies').then(function(response) {
        $scope.foodies = response.data;
        console.log($scope.foodies);
        initializeMap($scope.posts);
      });
    };
  });
})();
