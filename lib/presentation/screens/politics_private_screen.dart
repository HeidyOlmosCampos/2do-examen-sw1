import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/components/custom_app_bar.dart';
import 'package:flutter_template/presentation/constants/index.dart';

class PrivateScreen extends StatelessWidget {
  const PrivateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 25, 45),
      appBar: CustomAppBar(title: 'Politicas de Privacidad'),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  'En EmergyAI, nos comprometemos a proteger la privacidad de nuestros usuarios. '
                  'Esta Política de Privacidad describe cómo recopilamos, usamos, divulgamos y protegemos su información personal cuando utiliza nuestra aplicación y servicios.\n\n'
                  'Información que Recopilamos\n'
                  '1. Información Personal: Nombre, dirección de correo electrónico, número de teléfono y otros datos de contacto.\n'
                  '2. Información de Uso: Datos sobre cómo utiliza nuestra aplicación, incluyendo tiempo de uso, páginas visitadas, y acciones realizadas dentro de la aplicación.\n'
                  '3. Información Técnica: Dirección IP, tipo de dispositivo, sistema operativo, y otros datos técnicos.\n\n'
                  'Cómo Usamos Su Información\n'
                  '1. Provisión de Servicios: Para operar y mantener nuestra aplicación, así como para proporcionarle los servicios solicitados.\n'
                  '2. Mejora del Servicio: Para mejorar y personalizar su experiencia, y para desarrollar nuevas características y servicios.\n'
                  '3. Comunicación: Para enviarle notificaciones, actualizaciones, y otras informaciones relevantes sobre nuestro servicio.\n'
                  '4. Cumplimiento Legal: Para cumplir con nuestras obligaciones legales y proteger nuestros derechos legales.\n\n'
                  'Compartición de Información\n'
                  '1. Proveedores de Servicios: Podemos compartir su información con terceros proveedores de servicios que nos ayudan a operar nuestra aplicación y proporcionar nuestros servicios.\n'
                  '2. Cumplimiento Legal: Podemos divulgar su información si creemos que es necesario para cumplir con una obligación legal, proteger nuestros derechos, o proteger la seguridad de nuestros usuarios.\n\n'
                  'Seguridad de la Información\n'
                  'Implementamos medidas de seguridad adecuadas para proteger su información personal contra el acceso no autorizado, alteración, divulgación o destrucción.\n\n'
                  'Retención de Información\n'
                  'Retenemos su información personal durante el tiempo que sea necesario para cumplir con los propósitos para los cuales fue recopilada, a menos que la ley exija o permita un período de retención más prolongado.\n\n'
                  'Sus Derechos\n'
                  'Usted tiene derecho a acceder, corregir, o eliminar su información personal. Para ejercer estos derechos, por favor contacte con nosotros a través de los datos de contacto proporcionados a continuación.\n\n'
                  'Cambios en la Política de Privacidad\n'
                  'Podemos actualizar esta Política de Privacidad periódicamente. Le notificaremos sobre cualquier cambio publicando la nueva Política de Privacidad en nuestra aplicación y, en su caso, enviándole una notificación.',
                  style: TextStyle(fontSize: 16, color: gray),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
