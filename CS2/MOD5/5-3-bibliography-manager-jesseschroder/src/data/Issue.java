package data;

import java.util.ArrayList;

public class Issue {
    int year, volume, issue;
    Journal journal;
    ArrayList<Article> articles = new ArrayList<>();
    public static Issue nullIssue = new Issue(-1, -1, -1, null);

    public Issue(int year, int volume, int issue, Journal journal) {
        this.year = year;
        this.volume = volume;
        this.issue = issue;
        this.journal = journal;
    }

    public void addArticle(Article article) {
        articles.add(article);
        article.addToIssue(this);
    }

    public int year() {
        return this.year;
    }

    public ArrayList<Article> articles() {
        return this.articles;
    }

    public String articlestoString() {
        StringBuilder strBuild = new StringBuilder();
        for (Article arts : articles) {
            strBuild.append(arts.toString());
            strBuild.append(". ");
            strBuild.append(journal.title());
            strBuild.append(", Issue ");
            strBuild.append(issue);
            strBuild.append("(Vol. ");
            strBuild.append(volume);
            strBuild.append("), Published ");
            strBuild.append(year);
            strBuild.append("\n");
        }
        return strBuild.toString();
    }

    public String toString() {
        return "Issue " + issue + " Vol. ";
    }
}
