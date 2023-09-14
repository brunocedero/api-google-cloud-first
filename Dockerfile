FROM python:3.9-slim

# Directorio de trabajo
WORKDIR /app

# Copia el archivo de requisitos y el código fuente a la imagen
COPY api/requirements.txt .
COPY api/main.py .

# Instala las dependencias de Python desde el archivo de requisitos
RUN pip install --no-cache-dir -r requirements.txt

# Exponer el puerto en el que se ejecutará la aplicación FastAPI
EXPOSE 8000

# Comando para ejecutar la aplicación FastAPI
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
