public class Book {
    private String title, author;
    private long isbn;
    public static Book nullBook = new Book ("", "", -1);

    Book(String title, String author, long isbn) {
        this.title = title;
        this.author = author;
        this.isbn = isbn;
    }

    public String title() {
        return title;
    }
    public String author() { return author; }
    public long isbn() {
        return isbn;
    }
}
