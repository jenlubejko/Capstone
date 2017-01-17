(function() {
  angular.module("app").controller("postsCtrl", function($scope, $http) {
    $scope.setup = function() {
      $http.get('api/v1/posts').then(function(response) {
        $scope.posts = response.data;
        console.log($scope.posts);
        initializeMap($scope.posts);
      });
    };
  });
})();
