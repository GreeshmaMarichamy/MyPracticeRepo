
public class PdfFactory extends WordFactory{
    public Document createDocument()
    {
        return new PdfDocument();
    }
}
