package com;

import java.io.*;

public class Xml2String {

    public static String executePath(String path) throws IOException {
        File xmlFile = new File(path);

        Reader fileReader = new FileReader(xmlFile);
        BufferedReader bufReader = new BufferedReader(fileReader);

        StringBuilder sb = new StringBuilder();
        String line = bufReader.readLine();

        while (line != null) {
            sb.append(line).append("\n");
            line = bufReader.readLine();
        }
        bufReader.close();

        return sb.toString();
    }
}
