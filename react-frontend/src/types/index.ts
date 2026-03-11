interface User {
  id: number;
  name: string;
  email: string;
}

interface Post {
  id: number;
  title: string;
  content: string;
  authorId: number;
}

interface Comment {
  id: number;
  postId: number;
  content: string;
  authorId: number;
}