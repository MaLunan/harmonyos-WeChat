@Component
export struct InFoComponent {
  @Prop name: string;

  build() {
    Text(`${this.name}`)
  }
}