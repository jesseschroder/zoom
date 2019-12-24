package data;

public class Article {
    private String author, title;
    private Issue issue;

    public Article(String author, String title) {
        this(author, title, Issue.nullIssue);
    }

    public Article(String title, String author, Issue issue) {
        this.author = author;
        this.title = title;
        this.issue = issue;
    }

    public void addToIssue(Issue issue) {
        this.issue = issue;
    }

    public String toString() {
        return title + " by " + author;
    }

    public String author() {return author; }
}
