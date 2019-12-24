public class Reader {
    private String name;
    private Book book;

    Reader(String name){
        this.name = name;
        book = Book.nullBook;
    }

    public String getABook(Bookcase bookcase, String title) {
        if (book != Book.nullBook) return name + ", you already have a book!";
        book = bookcase.removeBook(title);
        return "Here you go " + name + ", you now have the book " + book.title();
    }

    public String whatBookDoYouHave() {
        if (book != Book.nullBook) return name + " currently has " + book.title() + " by " + book.author();
        return name + " does not have a book!";
    }

    public String putBackAnywhereOnCase(Bookcase bookcase) {
        String response = bookcase.placeBookAnywhere(book);
        book = Book.nullBook;
        return response;
    }

    public String putBackOnSpecificShelf(Bookcase bookcase, int shelf) {
        String response = bookcase.placeBookOnShelf(book, shelf);
        book = Book.nullBook;
        return response;
    }
}
