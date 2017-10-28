import estruturas.Pessoa;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

public class Main {

    public static void main(String[] args) {

        String[] nomes = {
                "Mário", "Ana Paula", "José", "Rodrigo",
                "Jorge", "Anderson", "Renata", "Pedro"
        };
        String[] sobrenomes = {
                "Castro", "Padrão", "Souza", "Pereira",
                "Trajano", "Silva", "Moreira", "Alvares"
        };

        List<Pessoa> lista = new ArrayList<Pessoa>();

        for (int i = 0; i < 6; ++i) {
            Pessoa x = new Pessoa();
            x.setNome(
                    nomes[new Random().nextInt(nomes.length)]
                    + " " +
                    sobrenomes[new Random().nextInt(sobrenomes.length)]
            );
            lista.add(x);
        }

        Collections.sort(lista);

        for (Pessoa p : lista) {
            System.out.println(p);
        }
    }
}
