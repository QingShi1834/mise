
export class NewsData {
  newsId: string;
  title: string;
  newsType: string;
  imgUrl: Resource;
  reads: string;
  likes: string;
  content: string;

  constructor(newsId: string, title: string, newsType: string, imgUrl: Resource, reads: string, likes: string, content: string) {
    this.newsId = newsId;
    this.title = title;
    this.newsType = newsType;
    this.imgUrl = imgUrl;
    this.reads = reads;
    this.likes = likes;
    this.content = content;
  }
}