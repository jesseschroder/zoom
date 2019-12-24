public class Bookcase {
    private Shelf[] shelves;
    int shelfTotal;
    private static int nullReturn = -1;

    Bookcase(int newShelves) {
        this.shelfTotal = newShelves;
        buildShelves();
    }

    public String placeBookAnywhere(Book book) {
        int availableShelf = firstAvailableShelfIndex();
        if (availableShelf < 0) return "Sorry, no room left on the bookcase!";
        String shelfResponse = shelves[availableShelf].placeBookOnShelf(book);
        return "The book " + book.title() + " by " + book.author() + " has been placed on shelf " +
                (availableShelf+1) + shelfResponse;
    }

    public String placeBookOnShelf(Book book, int shelf){
        if(!shelves[shelf-1].isThereRoom()) return "Sorry, no room left on this shelf!";
        String shelfResponse = shelves[shelf-1].placeBookOnShelf(book);
        return "The book " + book.title() + " by " + book.author() + " has been placed on shelf " + shelf + shelfResponse;
    }

    public Book removeBook(String title) {
        int shelfIndex = findByTitle(title);
        if(shelfIndex < 0) return Book.nullBook;
        return shelves[shelfIndex].removeBook(title);
    }

    private void buildShelves() {
        shelves = new Shelf[shelfTotal];
        for (int i = 0; i < shelfTotal; i++) shelves[i] = new Shelf();
    }

    private int firstAvailableShelfIndex() {
        for (int i = 0; i < shelfTotal; i++) {
            if (shelves[i].isThereRoom()) return i;
        }
        return nullReturn;
    }

    private int findByTitle(String title) {
        for (int i = 0; i < shelfTotal; i++) {
            if (shelves[i].isPresent(title)) return i;
        }
        return nullReturn;
    }
}