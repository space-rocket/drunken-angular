import {Component, OnInit} from 'angular2/core';
import {Post} from './post';
import {PostDetailComponent} from './post-detail.component';
import {PostService} from './post.service';

@Component({
  selector: 'my-app',
  template:`
	    <ul class="posts col-md-4">
	      <li *ngFor="#post of posts"
	        [class.selected]="post === selectedPost"
	        (click)="onSelect(post)">
	        <span class="badge">{{post.id}}</span> {{post.name}}
	      </li>
	    </ul>
	    <my-post-detail class="col-md-8" [post]="selectedPost"></my-post-detail>
  `,
  directives: [PostDetailComponent],
  providers: [PostService]
})
export class AppComponent implements OnInit {
	public title = 'Blog Posts';
  public posts: Post[];
  public selectedPost: Post;

  constructor(private _postService: PostService) { }

  getPosts() {
    this._postService.getPosts().then(posts => this.posts = posts);
  }

  ngOnInit() {
    this.getPosts();
  }

  onSelect(post: Post) { this.selectedPost = post; }
}
