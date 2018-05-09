package util;

public enum Horarios {

    H01("H01", "7:00", "7:50"),
    H02("H02", "7:50", "8:40"),
    H03("H03", "8:40", "9:30"),
    H04("H04", "9:45", "10:35"),
    H05("H05", "10:35", "11:25"),
    H06("H06", "11:25", "12:15"),
    H07("H07", "13:30", "14:20"),
    H08("H08", "15:10", "16:00"),
    H09("H09", "16:20", "17:10"),
    H10("H10", "17:10", "18:00"),
    H11("H11", "18:30", "19:20"),
    H12("H12", "19:20", "20:10"),
    H13("H13", "20:20", "21:10"),
    H14("H14", "21:10", "22:00"),
    H15("H15", "22:00", "22:40");
    private final String sigla;
    private final String inicio;
    private final String fim;

    private Horarios(String sigla, String inicio, String fim) {
        this.sigla = sigla;
        this.inicio = inicio;
        this.fim = fim;
    }

    public String getSigla() {
        return sigla;
    }

    public String getInicio() {
        return inicio;
    }

    public String getFim() {
        return fim;
    }
}
