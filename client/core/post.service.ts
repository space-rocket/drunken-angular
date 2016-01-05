import {Post} from './post';
import {POSTS} from './mock-posts';
import {Injectable} from 'angular2/core';

@Injectable()
export class PostService {
  getPosts() {
    return Promise.resolve(POSTS);
  }

  // See the "Take it slow" appendix
  getPostsSlowly() {
    return new Promise<Post[]>(resolve =>
      setTimeout(()=>resolve(POSTS), 0) // 0 seconds
    );
  }
}
