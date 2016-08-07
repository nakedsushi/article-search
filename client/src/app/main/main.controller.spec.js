describe('controllers', () => {
  let vm;
  let mockSearchService;
  let $rootScope;
  let $q;
  let queryDeferred;

  beforeEach(angular.mock.module('articleSearch'));
  beforeEach(inject( (_$q_, _$rootScope_) => {
    $q = _$q_;
    $rootScope = _$rootScope_;
  }));

  beforeEach(inject(($controller) => {
    mockSearchService =  {
      save: (query, fn) => {
        queryDeferred = $q.defer();
        return {$promise: queryDeferred.promise.then(response => {
          fn(response);
        })};
      }
    };

    spyOn(mockSearchService, 'save').and.callThrough();

    vm = $controller('MainController', {searchService: mockSearchService});
  }));

  describe('search', () => {
    it('should not hit the API if query is blank', () => {
      vm.search();
      expect(mockSearchService.save).not.toHaveBeenCalled();
      expect(vm.articles).toBeEmpty;
    });

    it('should not populate articles if response is empty', () => {
      vm.query = 'mini onions';
      vm.search();

      queryDeferred.resolve({articles: []});
      $rootScope.$apply();

      expect(vm.articles).toBeEmpty;
    });

    it('should populate articles if the response has articles', () => {
      vm.query = 'mini onions';
      vm.search();

      queryDeferred.resolve({articles: [
        {title: 'I love onions'},
        {title: 'Only sweet ones'}
      ]});
      $rootScope.$apply();

      expect(mockSearchService.save).toHaveBeenCalled();
      expect(vm.articles).toEqual([
        {title: 'I love onions'},
        {title: 'Only sweet ones'}
      ]);
    });
  });
});
