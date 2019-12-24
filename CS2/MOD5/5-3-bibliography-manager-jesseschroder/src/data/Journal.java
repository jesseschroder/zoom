package data;

import java.lang.reflect.Array;
import java.util.ArrayList;

public class Journal {
    private String title;
    private ArrayList<Issue> issues = new ArrayList<>();

    public Journal(String title) {
        this.title = title;
    }

    public static ArrayList<Journal> getSampleJournals() {
        Journal gameStudies = new Journal("Game Studies");
        Journal gameJournal = new Journal("The Computer Games Journal");
        Article article11 = new Article("“Gotta Catch ‘Em All” - Can Playing Pokémon Go Influence Mood and Empathy?",
                "Tracy Packiam Alloway, Rachel Carpenter");
        Article article12 = new Article("The Indiepocalypse: the Political-Economy of Independent Game Development Labor in Contemporary Indie Markets,",
                "Nadav D. Lipkin");
        Article article21 = new Article("The right way to play a game", "C. Thi Nguyen");
        Article article22 = new Article("“This Action Will Have Consequences”: Interactivity and Player Agency",
                "Sarah Stang");
        Article article31 = new Article("Toward Greener Gaming: Estimating National Energy Use and Energy Efficiency Potential",
                "Evan Mills");
        Article article32 = new Article("An Introduction to Spatial Sound Rendering in Virtual Environments and Games",
                "Mirza Beig");
        Article article41 = new Article("Broadening the Scope and Application for Computer Games Scholarship",
                "John Sutherland");
        Article article42 = new Article("Innovation in Game Development: IT Enablement and Affordances on Kickstarter",
                "Hrafnhildur Jonasdottir");

        Issue issue11 = new Issue(2019, 19, 2, gameStudies);
        Issue issue12 = new Issue(2019, 19, 1, gameStudies);
        Issue issue21 = new Issue(2018, 8, 4, gameJournal);
        Issue issue22 = new Issue(2018, 8, 2, gameJournal);

        issue11.addArticle(article11);
        issue11.addArticle(article12);
        issue12.addArticle(article21);
        issue12.addArticle(article22);
        issue21.addArticle(article31);
        issue21.addArticle(article32);
        issue22.addArticle(article41);
        issue22.addArticle(article42);

        gameStudies.addIssue(issue11);
        gameStudies.addIssue(issue12);
        gameJournal.addIssue(issue21);
        gameJournal.addIssue(issue22);

        ArrayList<Journal> journals = new ArrayList<Journal>(2);
        journals.add(gameStudies);
        journals.add(gameJournal);

        return journals;
    }


    public void addIssue(Issue issue) {
        issues.add(issue);
    }

    public String title() {
        return this.title;
    }

    public String findByYear(int year) {
        StringBuilder strBuild = new StringBuilder();
        for (Issue issue : issues) {
            if(issue.year() == year) strBuild.append(issue.articlestoString());
        }
        return strBuild.toString();
    }

    public int countIssues() {
        return issues.size();
    }

    public String issueStringByIndex(int iIndex) {
        return issues.get(iIndex).toString();
    }

    public boolean addArticle(int i, String title, String author) {
        issues.get(i).addArticle(new Article(title, author));
        return true;
    }

    public ArrayList<Article> allArticles() {
        ArrayList<Article> allArticles = new ArrayList<Article>();

        for (Issue issue : issues) allArticles.addAll(issue.articles());
        return allArticles;
    }
}

