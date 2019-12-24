package Clothing;

import Clothing.Accessories.*;
import Clothing.Outerwear.*;
import Clothing.Pants.*;
import Clothing.Shirts.*;
import Clothing.Shoes.*;

import java.util.ArrayList;
import java.util.Random;

public class Closet {

    ArrayList<Shirts> shirts;
    ArrayList<Pants> pants;
    ArrayList<Shoes> shoes;
    ArrayList<Outerwear> outWs;
    ArrayList<Accessories> accs;

    public Closet() {
        fillCloset();
    }

    public Outfit randomOutfit() {
        return new Outfit(shirts.get(randomIndex(shirts)),
                pants.get(randomIndex(pants)),
                shoes.get(randomIndex(shoes)),
                outWs.get(randomIndex(outWs)),
                accs.get((randomIndex(accs))));
    }

    private void fillCloset() {
        shirts = new ArrayList<>();
        pants = new ArrayList<>();
        shoes = new ArrayList<>();
        outWs = new ArrayList<>();
        accs = new ArrayList<>();

        shirts.add(new Tshirt());
        shirts.add(new Sweater());
        shirts.add(new ButtonUp());
        shirts.add(new Turtleneck());
        shirts.add(new Hoodie());
        shirts.add(new Shirtless());
        shirts.add(new Blazer());
        shirts.add(new NiceDress());

        pants.add(new Jeans());
        pants.add(new Khakis());
        pants.add(new Shorts());
        pants.add(new Pantless());
        pants.add(new DressPants());
        pants.add(new Slacks());
        pants.add(new Skirt());
        pants.add(new Leggings());
        pants.add(new CargoPants());

        shoes.add(new Dress());
        shoes.add(new Sneakers());
        shoes.add(new SteelToe());
        shoes.add(new Heels());
        shoes.add(new HikingBoots());
        shoes.add(new Sandles());
        shoes.add(new Skateboard());
        shoes.add(new Crocs());

        outWs.add(new WinterJacket());
        outWs.add(new SpringCoat());
        outWs.add(new BeerHat());
        outWs.add(new Umbrella());
        outWs.add(new Backpack());
        outWs.add(new Gloves());

        accs.add(new DesignerPurse());
        accs.add(new Rings());
        accs.add(new Earrings());
        accs.add(new Tie());
        accs.add(new HairPin());
        accs.add(new Toque());
        accs.add(new DiamondNecklace());
        accs.add(new FakeTatts());
    }

    private int randomIndex(ArrayList list) {
        Random rand = new Random();
        return rand.nextInt(list.size());
    }
}
