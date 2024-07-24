import styles from "./page.module.css";


export default function Home() {
  return (
    <>
      <main className={styles.main}>
        <h1 className={`${styles.bigText} ${styles.animatedText}`}>METALITO DIGITAL</h1>
        <h2 className={styles.mediumText}>
          <p className={styles.spacing}>Buscamos:</p>
          <ul>
            <li>Diseño Gráfico</li>
            <li>Animación</li>
            <li>Arte Digital</li>
            <li>Programación Front End</li>
            <li>Videografía</li>
          </ul>
        </h2>
        <div className={styles.grid}>
          <a href="mailto:info@metalito.com" className={styles.card}>
            <h2>Contacto <span>-&gt;</span></h2>
            <p>Escribenos un correo</p>
          </a>
        </div>
      </main>
    </>
  );
}