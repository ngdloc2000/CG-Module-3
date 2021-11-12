package model;

public class Blog {
    private int id;
    private String name;
    private String date;
    private TypeBlog typeBlog;
    private String image;

    public Blog(int id, String name, String dateCreated, TypeBlog typeBlog, String image) {
        this.id = id;
        this.name = name;
        this.date = dateCreated;
        this.typeBlog = typeBlog;
        this.image = image;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public TypeBlog getTypeBlog() {
        return typeBlog;
    }

    public void setTypeBlog(TypeBlog typeBlog) {
        this.typeBlog = typeBlog;
    }
}
