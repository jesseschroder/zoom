package testing;

import Clothing.OutfitBuilder;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class UIFrame extends JFrame implements ActionListener {
    JButton bChange;
    JLabel label;
    OutfitBuilder outfit;

    UIFrame (String title) {
        super(title);
        outfit = new OutfitBuilder();
        setLayout(new FlowLayout());


        bChange = new JButton("Generate Outfit");
        bChange.addActionListener(this);
        add(bChange);

        label = new JLabel(outfit.buildSampleOutfit());
        add(label);

        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }

    public void actionPerformed(ActionEvent e) {
        label.setText(outfit.buildSampleOutfit());
    }
}
