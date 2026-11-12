# Archivo de compilación para las placas Samsung legacy
samsung_ss = ss.source_set()
samsung_ss.add(files(
  'msm7227.c',
  'msm8255.c',
))

# Integrarlo al subsistema ARM de QEMU
hw_arch += {'arm': samsung_ss}
