    public static class EmbeddedResourceDeserialiser
    {
        public static string GetSqlString(string name, Assembly assembly)
        {
            var resourceName = $"{assembly.GetName().Name}.SQL.{name}";

            using (Stream stream = assembly.GetManifestResourceStream(resourceName))
            using (StreamReader reader = new StreamReader(stream))
            {
                return reader.ReadToEnd();
            }
        }
    }
