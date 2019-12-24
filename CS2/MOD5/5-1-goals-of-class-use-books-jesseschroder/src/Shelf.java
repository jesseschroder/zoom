public class Shelf {
    private static int shelfCapacity = 10;
    private Book[] books;


    public Shelf() {
        generateBookArray();
    }

    public String placeBookOnShelf(Book book) {
        int index = findEmptyLocation();
        books[index] = book;
        return " in the " + (index + 1) + " location";
    }

    public boolean isThereRoom() {
        for (int i = 0; i < shelfCapacity; i++)
            if(books[i] == Book.nullBook) return true;
        return false;
    }

    public boolean isPresent(String title) {
        for (int i = 0; i < shelfCapacity; i++)
            if(books[i].title().equals(title)) return true;
        return false;
    }

    public Book removeBook(String title) {
        Book toReturn = Book.nullBook;
        for (int i = 0; i < shelfCapacity; i++)
            if(books[i].title().equals(title)) {
                toReturn = books[i];
                books[i] = Book.nullBook;
            }
        return toReturn;
    }

    private void generateBookArray() {
        books = new Book[shelfCapacity];
        for (int i = 0; i < shelfCapacity; i++)
            books[i] = Book.nullBook;
    }

    private int findEmptyLocation() {
        int count = 0;
        while(books[count] != Book.nullBook) {
            count++;
        }
        return count;
    }
}
