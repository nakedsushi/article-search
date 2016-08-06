export class SearchService {
  constructor ($resource) {
    'ngInject';

    return $resource('http://localhost:3000/searches', {search: '@query'});
  }
}

