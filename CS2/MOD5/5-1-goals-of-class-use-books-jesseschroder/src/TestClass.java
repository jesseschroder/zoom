public class TestClass {

    public static void fillWithStuff(Bookcase bookcase) {
        System.out.println(bookcase.placeBookAnywhere(
                new Book("Harry Potter and the Philosopher's Stone", "J.K. Rowling", 9781408855652L)));
        System.out.println(bookcase.placeBookAnywhere(
                new Book("Harry Potter and the Chamber of Secrets", "J.K. Rowling", 1408855666L)));
        System.out.println(bookcase.placeBookAnywhere(
                new Book("Harry Potter and the Prisoner of Azkaban", "J.K. Rowling", 1408855674L)));
        System.out.println(bookcase.placeBookAnywhere(
                new Book("Harry Potter and the Goblet of Fire", "J.K. Rowling", 9781408855928L)));
        System.out.println(bookcase.placeBookAnywhere(
                new Book("Harry Potter and the Order of the Phoenix", "J.K. Rowling", 9781408855690L)));
        System.out.println(bookcase.placeBookAnywhere(
                new Book("Harry Potter And The Half Blood Prince", "J.K. Rowling", 1594132216L)));
        System.out.println(bookcase.placeBookAnywhere(
                new Book("Harry Potter and the Deathly Hallows", "J.K. Rowling", 1408855712L)));
        System.out.println(bookcase.placeBookAnywhere(
                new Book("The Fellowship of the Ring", "J. R. R. Tolkien", 9780261102354L)));
        System.out.println(bookcase.placeBookAnywhere(
                new Book("The Two Towers", "J. R. R. Tolkien", 0261102362L)));
        System.out.println(bookcase.placeBookAnywhere(
                new Book("The Return of the King", "J. R. R. Tolkien", 0261102370L)));
    }

    public static void fillMoreStuff(Bookcase bookcase){
        System.out.println(bookcase.placeBookOnShelf(
                new Book("A Game of Thrones", "George R. R. Martin", 0553573403L), 3));
        System.out.println(bookcase.placeBookOnShelf(
                new Book("A Clash of Kings", "George R. R. Martin", 0553574222L), 3));
        System.out.println(bookcase.placeBookOnShelf(
                new Book("A Storm of Swords", "George R. R. Martin", 055357342L), 3));
        System.out.println(bookcase.placeBookOnShelf(
                new Book("A Feast for Crows", "George R. R. Martin", 9780553582024L), 3));
        System.out.println(bookcase.placeBookOnShelf(
                new Book("A Dance with Dragons", "George R. R. Martin", 9780553582017L), 3));
    }

    public static String strCompare(String in, String out) {
        if (in.equals(out)) {
            return "... Passed!\n";
        } else {
            return "... Failed!\nExpected: " + in + "\n Actual: " + out + "\n";
        }
    }

    public static void main(String[] args) {
        Bookcase bookcase = new Bookcase(5);
        System.out.println("******\n \tBookcase created with 5 shelves creates. Filling first with 10 books. \n******\n");
        fillWithStuff(bookcase);
        System.out.println("******\n \tLoading Shelf 3 with 7 books.\n******\n");
        fillMoreStuff(bookcase);
        System.out.println("******\n \tTesting bookcase methods directly.\n******\n");

        System.out.println("Add a book");
        System.out.println(strCompare(bookcase.placeBookAnywhere(new Book("Test", "Test", 123L)),
                "The book Test by Test has been placed on shelf 2 in the 1 location"));

        System.out.println("Add a book to shelf 4");
        System.out.println(strCompare(bookcase.placeBookOnShelf(new Book("Test", "Test", 123L), 4),
                "The book Test by Test has been placed on shelf 4 in the 1 location"));

        System.out.println("Add a book on shelf 3 (after GOT)");
        System.out.println(strCompare(bookcase.placeBookOnShelf(new Book("Test", "Test", 123L), 3),
                "The book Test by Test has been placed on shelf 3 in the 6 location"));

        System.out.println("Can't add to first shelf because it's full");
        System.out.println(strCompare(bookcase.placeBookOnShelf(new Book("Test", "Test", 123L), 1),
                "Sorry, no room left on this shelf!"));

        System.out.println("Removing a book by title directly from the case retrieves the book object");
        System.out.println(bookcase.removeBook("Harry Potter and the Philosopher's Stone"));

        System.out.println("\nThe first slot should now be open and we can put a test book in");
        System.out.println(strCompare(bookcase.placeBookAnywhere(new Book("Test", "Test", 123L)),
                "The book Test by Test has been placed on shelf 1 in the 1 location"));

        System.out.println("******\n \tTesting reader methods.\n******\n");
        Reader me = new Reader("jesse");

        System.out.println("\nReader can take a book");
        System.out.println(strCompare(me.getABook(bookcase, "The Fellowship of the Ring"),
                "Here you go jesse, you now have the book The Fellowship of the Ring"));

        System.out.println("\nReader responds with proper book title");
        System.out.println(strCompare(me.whatBookDoYouHave(),
                "jesse currently has The Fellowship of the Ring by J. R. R. Tolkien"));

        System.out.println("\nReader can put a book back on a shelf");
        System.out.println(strCompare(me.putBackAnywhereOnCase(bookcase),
                "The book The Fellowship of the Ring by J. R. R. Tolkien has been placed on shelf 1 in the 8 location"));

        me.getABook(bookcase, "Test");
        System.out.println("\nReader can put a book back on a specific shelf");
        System.out.println(strCompare(me.putBackOnSpecificShelf(bookcase, 4),
                "The book Test by Test has been placed on shelf 4 in the 2 location"));
    }
}
