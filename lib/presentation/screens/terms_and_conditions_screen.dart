import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/components/custom_app_bar.dart';
import 'package:flutter_template/presentation/constants/index.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 25, 45),
      appBar: CustomAppBar(title: 'Terminos y Condiciones'),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  'Estos Términos y Condiciones rigen el uso de la aplicación EmergyAI y los servicios proporcionados por EmergyAI. '
                  'Al utilizar nuestra aplicación, usted acepta cumplir con estos términos.\n\n'
                  'Uso de la Aplicación\n'
                  '1. Elegibilidad: Debe ser mayor de edad y tener capacidad legal para aceptar estos términos.\n'
                  '2. Cuenta de Usuario: Es responsable de mantener la confidencialidad de su cuenta y contraseña, y acepta notificar de inmediato cualquier uso no autorizado de su cuenta.\n'
                  '3. Uso Permitido: Solo puede utilizar nuestra aplicación para los fines permitidos por la ley y de acuerdo con estos términos.\n\n'
                  'Propiedad Intelectual\n'
                  'Todos los derechos de propiedad intelectual sobre la aplicación y los servicios pertenecen a EmergyAI. Usted no puede copiar, modificar, distribuir, vender o arrendar ninguna parte de nuestros servicios o software.\n\n'
                  'Tarifas y Pagos\n'
                  '1. Suscripción y Licencias: Algunos servicios pueden requerir el pago de tarifas de suscripción o licencia. Estas tarifas se detallarán claramente en nuestra aplicación.\n'
                  '2. Política de Reembolsos: Las tarifas pagadas no son reembolsables, excepto donde lo requiera la ley aplicable.\n\n'
                  'Limitación de Responsabilidad\n'
                  '1. Exclusión de Garantías: Nuestra aplicación se proporciona «tal cual» y «según disponibilidad», sin garantías de ningún tipo.\n'
                  '2. Limitación de Daños: En la medida máxima permitida por la ley, no seremos responsables por ningún daño indirecto, incidental, especial, consecuente o punitivo.\n\n'
                  'Terminación\n'
                  'Podemos suspender o terminar su acceso a nuestra aplicación en cualquier momento, sin previo aviso, si incumple estos términos o si creemos que su uso de nuestra aplicación puede causar daños a nosotros o a otros usuarios.\n\n'
                  'Modificaciones a los Términos\n'
                  'Nos reservamos el derecho de modificar estos términos en cualquier momento. Le notificaremos sobre cualquier cambio publicando los nuevos términos en nuestra aplicación y, en su caso, enviándole una notificación.',
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
