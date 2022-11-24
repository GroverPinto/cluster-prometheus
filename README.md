# Cluster Prometheus con Grafana

### 1. Usar vagrant para el aprovisionamiento de IT

Para modificar o realizar cambios en la infraestructura necesaria, se debe modificar el archivo **Vagrantfile**

```sh
vagrant up
```

### 2. Copiar la llave ssh para acceso del usuario **ansible**

Es necesario correr el siguiente comando, con todas las maquinas, actualmente el password para el usuario ansible esta definido en el archivo de provisionamiento add_user.sh

```sh
ssh-copy-id ansible@10.0.30.1x
```

### 3. Generar la lista hosts para ansible

Para que ansible pueda conectarse y aplicar las recetas es necesario crear el inventario. A continuacion se pone un ejemplo. Este archivo generalmente se llama hosts/inventory

```sh
[prometheus]
10.0.30.10      ansible_ssh_user=ansible
10.0.30.11      ansible_ssh_user=ansible
10.0.30.12      ansible_ssh_user=ansible

[grafana]
10.0.30.13      ansible_ssh_user=ansible

```

### 4. Ejecutar la receta ansible

Para lo mismo es necesario ejecutar el comando de la siguiente manera:

```sh
ansible-playbook -i ruta/mi/archivo_hosts ruta/mi/receta_ansible  -vvv
```

Para ejecutar la instalación del cluster **prometheus**

```sh
ansible-playbook -i hosts ansible/prom.yml  -vvv
```

Para ejecutar la instalación de **grafana**:

```sh
ansible-playbook -i hosts ansible/grafana.yml -vvv
```
