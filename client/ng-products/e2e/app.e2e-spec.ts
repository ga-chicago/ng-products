import { NgProductsPage } from './app.po';

describe('ng-products App', () => {
  let page: NgProductsPage;

  beforeEach(() => {
    page = new NgProductsPage();
  });

  it('should display welcome message', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('Welcome to app!');
  });
});
