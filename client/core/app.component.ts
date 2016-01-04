import {Component} from 'angular2/core';

interface Post {
  id: number;
  title: string;
}

@Component({
  selector: 'my-app',
  template: `
    <h1>{{title}}</h1>
    <h2>{{post.title}} details!</h2>
    <div>
    	<label>id: </label>{{post.id}}
    </div>
    <form>
      <label>title: </label>
      <input [(ngModel)]="post.title" placeholder="title">
    </form>
    `
})
export class AppComponent {
  public title = 'Blog Posts';
  public post: Post = {
    id: 1,
    title: 'Hello World'
  };
}
