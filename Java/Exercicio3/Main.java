import estruturas.*;

import java.util.ArrayList;
import java.util.List;

public class Main {

    private static int rand(int min, int max) {
        return min + (int)Math.round(Math.random() * (max - min));
    }

    private static Pessoa randomPessoa() {
        int tipo = rand(0, 3);
        Pessoa x;
        switch (tipo) {
            case 0:
                x = new Pessoa();
                break;
            case 1:
                x = new Funcionario();
                break;
            case 2:
                x = new Aluno();
                break;
            default:
                x = new Pessoa();
                break;
        }

        x.setDtnascimento(DateHelper.getDate("0"+rand(1,9) + "/0"+rand(1,9) + "/"+rand(1900,2017)));
        return x;
    }

    public static void main(String[] args) {

        List<Pessoa> lista = new ArrayList<Pessoa>();

        for (int i = 0; i < 6; ++i) {
            lista.add(randomPessoa());
        }

        for (Pessoa x : lista) {
            System.out.println(x);
            System.out.println("\n");
        }
    }
}
