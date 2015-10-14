
package app.model;


public class School
{
    private int gid;
    private String name;
    private String description;
    private String address;
    private String worktime;
    private String phone;
    private String image;
    private String geometry;
    private double x;
    private double y;
    public double getX()
    {
        return x;
    }
    public void setX(double x)
    {
        this.x = x;
    }
    public double getY()
    {
        return y;
    }
    public void setY(double y)
    {
        this.y = y;
    }
    
    public String getGeometry()
    {
        return geometry;
    }
    public void setGeometry(String geometry)
    {
        this.geometry = geometry;
    }
    public int getGid()
    {
        return gid;
    }
    public void setGid(int gid)
    {
        this.gid = gid;
    }
    public String getName()
    {
        return name;
    }
    public void setName(String name)
    {
        this.name = name;
    }
    public String getDescription()
    {
        return description;
    }
    public void setDescription(String description)
    {
        this.description = description;
    }
    public String getAddress()
    {
        return address;
    }
    public void setAddress(String address)
    {
        this.address = address;
    }
    public String getWorktime()
    {
        return worktime;
    }
    public void setWorktime(String worktime)
    {
        this.worktime = worktime;
    }
    public String getPhone()
    {
        return phone;
    }
    public void setPhone(String phone)
    {
        this.phone = phone;
    }
    public String getImage()
    {
        return image;
    }
    public void setImage(String image)
    {
        this.image = image;
    }
}
