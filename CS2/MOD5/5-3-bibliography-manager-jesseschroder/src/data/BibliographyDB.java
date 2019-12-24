package data;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public class BibliographyDB {

    private ArrayList<Journal> journals;
    private boolean connected = false;
    private HashMap<String, Integer> authorCount;

    public BibliographyDB() {
        this(new ArrayList<Journal>());
    }

    public BibliographyDB(ArrayList<Journal> journals) {

        this.journals = journals;
        countAuthors();
    }

    public void openConnection() { connected = true; }

    public boolean isConnected() { return connected; }

    public void closeConnection() { connected = false; }

    public String findByYear(int year) {
        StringBuilder strBuild = new StringBuilder();
        for(Journal journal : journals) strBuild.append(journal.findByYear(year));
        return (!strBuild.toString().isEmpty()) ? strBuild.toString() : "No results!";
    }

    public int countJournals() {
        return journals.size();
    }

    public String listJournals() {
        StringBuilder strBuild = new StringBuilder();
        for (int i = 0; i < countJournals(); i++) {
            strBuild.append("\t");
            strBuild.append(i + 1);
            strBuild.append(". ");
            strBuild.append(journals.get(i).title());
            strBuild.append("\n");
        }
        return strBuild.toString();
    }

    public int countJournalIssues(int jIndex) {
        return journals.get(jIndex).countIssues();
    }

    public String listJournalIssues(int jIndex) {
        StringBuilder strBuild = new StringBuilder();
        for (int i = 0; i < countJournalIssues(jIndex); i++) {
            strBuild.append("\t");
            strBuild.append(i + 1);
            strBuild.append(". ");
            strBuild.append(journals.get(jIndex).issueStringByIndex(i));
            strBuild.append("\n");
        }
        return strBuild.toString();
    }

    public String addNewArticle(int j, int i, String title, String author) {
        authorCount.put(author, authorCount.getOrDefault(author, 0) +1);
        return (journals.get(j).addArticle(i, title, author)) ? "Success!" : "Something went wrong!";
    }

    public String mostFreqAuthor() {
        int largestValue=(Collections.max(authorCount.values()));
        for (Map.Entry<String, Integer> entry : authorCount.entrySet()) {
            if (entry.getValue() == largestValue) {
                return entry.getKey() + " with " + entry.getValue() + " articles.";
            }
        }
      return  "fail";
    }

    private void countAuthors() {
        authorCount = new HashMap<>();
        ArrayList<Article> allArticles = new ArrayList<>();
        for (Journal journal : journals) allArticles.addAll(journal.allArticles());
        for (Article article : allArticles) {
            authorCount.put(article.author(),
                    authorCount.getOrDefault(article.author(), 0) +1 );
        }
    }
}
