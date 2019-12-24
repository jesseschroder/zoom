package Clothing;


import Clothing.Pants.*;
import Clothing.Shirts.*;


public class OutfitBuilder {
    Outfit outfit;
    Closet closet;

    public OutfitBuilder() {
        this(new Closet(), new Outfit());
    }

    OutfitBuilder(Closet closet, Outfit outfit) {
        this.closet = closet;
        this.outfit = outfit;
    }

    public String buildSampleOutfit() {
        boolean buildingOutfit = true;
        int count = 0;

        while (buildingOutfit) {
            count++;
            outfit = closet.randomOutfit();

            // Check if the outfit is too plain
            if (outFitIsPlain()) continue;

            // Check if the outfit is compatible with either warm temperature or cold temperature
            if (!wearInTheCold() && !wearInTheHeat()) continue;

            // Check if the outfit is too colourful
            if (outFitTooColourful()) continue;

            // Only dressy clothing can go with dressy clothing
            if (!outfitDressy() && !outfitCasual()) continue;

            // Protect from being naked
            if (!nakedOptionsMatch()) continue;

            // Only certain shirts can have ties
            if (!tieOnProperShirt()) continue;

            // Don't mix too many athletic pieces with casual
            if (outFitHalfAthletic()) continue;

            buildingOutfit = false;
        }
        return outfitString(count);
    }

    private boolean outFitIsPlain() {
        return (outfit.getTop().plain() &&
                outfit.getBottom().plain() &&
                outfit.getShoes().plain() &&
                outfit.getAcc().plain());
    }

    private boolean wearInTheCold() {
        return (outfit.getTop().wearInTheCold() &&
                outfit.getBottom().wearInTheCold() &&
                outfit.getShoes().wearInTheCold() &&
                outfit.getOutW().wearInTheCold());
    }

    private boolean wearInTheHeat() {
        return (outfit.getBottom().wearInTheHeat() &&
                outfit.getTop().wearInTheHeat() &&
                outfit.getShoes().wearInTheHeat() &&
                outfit.getOutW().wearInTheHeat());
    }

    private boolean outFitTooColourful() {
        return (outfit.getTop().colourful() &&
                outfit.getBottom().colourful() &&
                outfit.getShoes().colourful());
    }

    private boolean outfitDressy() {
        return (outfit.getTop().dressy() &&
                outfit.getShoes().dressy() &&
                outfit.getBottom().dressy() &&
                outfit.getOutW().dressy() &&
                outfit.getAcc().dressy());
    }

    private boolean outfitCasual() {
        return (outfit.getTop().casual() &&
                outfit.getBottom().casual() &&
                outfit.getShoes().casual() &&
                !outfit.getAcc().isJewelry() &&
                !outfit.getAcc().dressy());
    }

    private boolean nakedOptionsMatch() {
        if (outfit.getTop() instanceof Shirtless && outfit.getBottom() instanceof Shorts) {
            // Shirtless should only be with shorts
            return true;
        } else if (outfit.getTop() instanceof NiceDress && outfit.getBottom() instanceof Pantless) {
            // Pantless should only be with a dress
            return true;
        } else if (outfit.getTop() instanceof NiceDress && !(outfit.getBottom() instanceof Pantless)) {
            // Dresses can't be worn with pants
            return false;
        }
        else if (!(outfit.getTop() instanceof Shirtless) && !(outfit.getBottom() instanceof Pantless)) {
            // Other combos are okay!
            return true;
        } else {
            // Missing clothing
            return false;
        }
    }

    private boolean tieOnProperShirt() {
        // Check if tie is worn, then is it worn with a compatible shirt
        return (!outfit.getAcc().isTie() || (outfit.getAcc().isTie() && outfit.getTop().wearWithTie()));
    }

    private boolean outFitHalfAthletic() {
        int count = 0;
        if (outfit.getTop().athletic()) count++;
        if (outfit.getBottom().athletic()) count++;
        if (outfit.getShoes().athletic()) count++;

        if (count == 2) return true;
        return false;
    }

    private String outfitString(int count) {
        return "<html><body><h2>Outfit generated!</h1><br>" +
                "\n\t<p><br><b>Top:</b> \t\t" + outfit.getTop().toString() +
                "\n\t<br><b>Bottoms:</b> \t" + outfit.getBottom().toString() +
                "\n\t<br><b>Shoes:</b> \t\t" + outfit.getShoes().toString() +
                "\n\t<br><b>Outerwear:</b> \t" + outfit.getOutW().toString() +
                "\n\t<br><b>Accessory:</b> \t" + outfit.getAcc().toString() +
                "\n<br><br>It took <b>" + count + "</b> attempts</p></body><html>";
    }
}
