public class complexwrapper {

    
    public string abc;
    public string xyzz;
    public list<wrapper>  mixwrap;
    public class  wrapper
    {
        public string name;
        public string id ;
        public string rating;
        public wrapper(string name, string id , string rating)
        {
            this.name = name;
            this.id = id;
            this.rating = rating;
        }
    }
}