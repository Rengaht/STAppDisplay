class SortFile implements Comparable{
    public long t;
    public File f;

    public SortFile(File file){
        f = file;
        t = file.lastModified();
    }

    public int compareTo(Object o){
        long u = ((SortFile) o).t;
        return t < u ? -1 : t == u ? 0 : 1;
    }
};
