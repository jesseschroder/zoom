package ui;

import data.BibliographyDB;
import data.Journal;

import java.util.Scanner;

public class BibliographyUI {

    private BibliographyDB data;
    private static String optionSelection = "\nWhat would you like to do?\n\t1. Display Articles by Year\n" +
            "\t2. Add Article to Issue\n\t3. Find most-published Author\n\t4. Quit\nEnter 1,2,3,4: ";

    BibliographyUI(BibliographyDB newDB) {data = newDB;}

    void openInput() {
        data.openConnection();
        System.out.println("Welcome to the bibliography.");


        while(data.isConnected()) {
            System.out.print(optionSelection);
            Scanner input = new Scanner(System.in);
            int choiceIndex = (input.hasNextInt()) ? input.nextInt() : -1;
            System.out.println(analyzeInput(choiceIndex));
        }
    }

    private String analyzeInput(int input) {
        switch (input) {
            case 1 :
                return yearCommand();
            case 2 :
                return addCommand();
            case 3 :
                return data.mostFreqAuthor();
            case 4 :
                data.closeConnection();
                return "Bye!";
            default :
                return "That's not a valid input!";
        }
    }

    private String yearCommand() {
        System.out.print("Enter a year: ");
        Scanner yearInput = new Scanner(System.in);
        int year = (yearInput.hasNextInt()) ? yearInput.nextInt() : -1;
        return (year > 0) ? data.findByYear(year) : "That's not a valid input!";
    }

    private String addCommand() {
        int jInedx = journalSelection();
        if (jInedx < 0) return "Try again.";
        int iIndex = issueSelection(jInedx-1);
        if (iIndex < 0) return "Try again.";

        String title = getStringInput("title");
        String author = getStringInput("author");

        return data.addNewArticle(jInedx-1, iIndex-1, title, author);
    }

    private int journalSelection() {
        System.out.println("Which Journal should the new article be added to?");
        int count = data.countJournals();
        if (count < 1) {
            System.out.println("No Journals!");
            return -1;
        }
        System.out.println(data.listJournals());
        System.out.print("Enter you choice: ");
        Scanner journalInput = new Scanner(System.in);
        int jIndex = (journalInput.hasNextInt()) ? journalInput.nextInt() + 1 : -1;
        return (jIndex <= count) ? jIndex : -1;
    }

    private int issueSelection(int jIndex) {
        System.out.println("Which Issue should the new article be added to?");
        int count = data.countJournalIssues(jIndex);
        if (count < 1) {
            System.out.println("No Issues!");
            return -1;
        }
        System.out.println(data.listJournalIssues(jIndex));
        System.out.print("Enter you choice: ");
        Scanner journalInput = new Scanner(System.in);
        int iIndex = (journalInput.hasNextInt()) ? journalInput.nextInt() + 1 : -1;
        return (iIndex <= count) ? iIndex : -1;
    }

    private String getStringInput(String option) {
        System.out.print("Please enter a " + option + " ");
        Scanner input = new Scanner(System.in);
        return input.nextLine();
    }

    public static void main(String[] args) {
        BibliographyUI ui = new BibliographyUI(new BibliographyDB(Journal.getSampleJournals()));
        ui.openInput();
    }
}
