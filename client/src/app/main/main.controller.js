export class MainController {
  constructor (ngAudio, searchService) {
    'ngInject';

    this.searchService = searchService;
    this.ngAudio = ngAudio;
  }

  search() {
    const that = this;
    this.showLoading = true;
    if (this.query) {
      this.searchService.save({search: this.query}, response => {
        this.showLoading = false;
        that.articles = response.articles;
      });
    }
  }

  play(clip) {
    this.ngAudio.play(`http://localhost:3000/${clip.path}`);
  }
}
