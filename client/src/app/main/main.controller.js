export class MainController {
  constructor ($log, ngAudio, searchService) {
    'ngInject';

    this.searchService = searchService;
    this.$log = $log;
    this.ngAudio = ngAudio;
  }

  search() {
    const that = this;
    if (this.query) {
      this.searchService.save({search: this.query}, function(response) {
        that.articles = response.articles;
      });
    }
  }

  play(clip) {
    this.ngAudio.play(`http://localhost:3000/${clip.path}`);
  }
}
