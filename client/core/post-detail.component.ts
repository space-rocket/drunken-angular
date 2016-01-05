import {Component} from 'angular2/core';
import {Post} from './post';

@Component({
  selector: 'my-post-detail',
  template: `
    <div *ngIf="post">
      <h2>{{post.name}}</h2>
      <div><label>id: </label>{{post.id}}</div>
      <div>
        <label>name: </label>
        <input [(ngModel)]="post.name" placeholder="name"/>
      </div>
    </div>
  `,
  inputs: ['post']
})
export class PostDetailComponent {
  public post: Post;
}
